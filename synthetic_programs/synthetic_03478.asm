; mixed program
; initialization
  LDI r8, 8
  LDI r11, 64
  LDI r10, 3991
  LDI r7, 8
  LDI r1, 0x40062F
  LDI r9, 0x77DE09
  SHR r8, r2, r13
  SAR r24, r0, r10
  SHLI r8, r12, 0xCA04E3
  SAR r13, r12, r15
  SHL r0, r10, r15
  SAR r13, r6, r10
  XOR r3, r8, r5
  IKEY r3
  CMPI r3, 255
  JNZ r3, key_0
  LDI r1, 49
loop_1:
  SUBI r3, r1, 152
  LDI r15, 1
  SUB r1, r1, r15
  JNZ r1, loop_1
main_2:
  SHL r3, r12, r15
  SHR r23, r14, r1
  SHR r8, r3, r13
  SHL r0, r7, r3
  LDI r20, 0xC00A15
  LDI r17, 0
  LDI r18, 32
  DRAWTEXT r20, r17, r18, "WORLD"
  IKEY r3
  CMPI r3, 256
  JNZ r3, key_3
  XOR r15, r9, r0
  AND r10, r6, r9
  OR r6, r5, r1
  OR r1, r6, r15
  FRAME
  JMP main_2
