; mixed program
; initialization
  LDI r4, 0x244A83
  LDI r11, 3993
  LDI r6, 0x1274D7
  IKEY r0
  CMPI r0, 136
  JNZ r0, key_0
  PUSH r10
  PUSH r12
  PUSH r7
  MUL r13, r11, r6
  SHR r1, r6, r12
  POP r7
  POP r12
  POP r10
  PUSH r3
  AND r12, r4, r3
  MOD r7, r14, r9
  POP r3
  LDI r0, 1
loop_1:
  LDI r4, 3092
  LDI r6, 0x4D93EC
  LDI r1, 255
  LDI r5, 32
  LDI r29, 1924
  LINE r4, r6, r1, r5, r29
  SUBI r0, r19, 0x564C03
  LDI r10, 1
  SUB r0, r0, r10
  JNZ r0, loop_1
  LDI r15, 255
  LDI r12, 0xD12ECF
  LDI r21, 0x889A5A
  DRAWTEXT r15, r12, r21, "WORLD"
  CALL func_2
func_2:
  SHL r9, r14, r7
  XOR r15, r11, r14
  DIV r15, r10, r7
  AND r24, r2, r11
  XOR r5, r15, r6
  SUB r14, r18, r15
  RET
  CMPI r11, 64
  HALT
