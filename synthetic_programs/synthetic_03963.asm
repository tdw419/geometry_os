; mixed program
; initialization
  LDI r4, 0x37ADCE
  LDI r6, 0xE8B45B
  LDI r9, 2192
  LDI r13, 10
  LDI r5, 1515
  LDI r11, 0xA6C740
  LDI r8, 0xEC13B2
  LDI r1, 0x3C373E
  SHR r6, r12, r7
  LDI r13, 4
loop_0:
  CMPI r0, r3, 32
  SUBI r28, r6, 255
  LDI r5, 0xB8DBE4
  LDI r8, 255
  LDI r6, 978
  LDI r1, 3356
  CIRCLE r5, r8, r6, r1
  LDI r11, 1
  SUB r13, r13, r11
  JNZ r13, loop_0
  SHLI r8, r6, 0xD2929C
  SHL r10, r13, r8
  SHL r15, r2, r14
  AND r11, r8, r5
  XOR r0, r12, r6
  XOR r15, r4, r10
  OR r27, r10, r5
  CALL func_1
func_1:
  AND r1, r31, r6
  OR r3, r4, r12
  SUB r13, r7, r1
  DIV r16, r13, r7
  OR r3, r8, r12
  RET
  AND r2, r0, r5
  AND r10, r2, r5
  XOR r0, r2, r24
  HALT
