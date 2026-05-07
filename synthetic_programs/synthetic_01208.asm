; mixed program
; initialization
  LDI r7, 2853
  LDI r2, 2929
  LDI r4, 255
  LDI r5, 1
  SAR r2, r8, r11
  SHL r7, r0, r14
  MOD r7, r2, r10
  DIV r22, r4, r15
  AND r1, r12, r6
  SAR r1, r8, r18
  SAR r10, r9, r3
  IKEY r0
  CMPI r0, 0xFDFEB2
  JNZ r0, key_0
  PUSH r4
  PUSH r12
  SUB r0, r8, r3
  OR r9, r4, r15
  ADD r20, r8, r5
  POP r12
  POP r4
  LDI r15, 12
loop_1:
  XOR r8, r7, r13
  LDI r10, 1
  SUB r15, r15, r10
  JNZ r15, loop_1
main_2:
  LDI r12, 1711
  LDI r2, 255
  LDI r9, 16
  DRAWTEXT r12, r2, r9, "WORLD"
  LDI r5, 0x2CB94F
  LDI r5, 10
  LDI r13, 394
  LDI r9, 3060
  CIRCLE r5, r5, r13, r9
  SAR r13, r9, r0
  SHL r5, r13, r11
  SHR r5, r13, r6
  SAR r5, r10, r14
  OR r4, r14, r29
  XOR r14, r13, r1
  AND r1, r7, r2
  LDI r0, 0x5D256F
  LDI r11, 16
  LDI r6, 255
  WPIXEL
  CMPI r10, r2, 231
  FRAME
  JMP main_2
