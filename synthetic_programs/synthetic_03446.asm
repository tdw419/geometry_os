; input driven program
; initialization
  LDI r1, 32
  LDI r0, 256
  LDI r13, 0xCD2B74
  LDI r4, 8
  LDI r6, 128
  LDI r12, 255
  LDI r8, 2583
main_0:
  LDI r15, 3175
  LDI r15, 256
  LDI r0, 2881
  WPIXEL
  AND r10, r12, r14
  IKEY r4
  CMPI r4, 158
  JNZ r4, key_1
  SHR r6, r4, r12
  SHL r6, r12, r8
  SHL r13, r1, r9
  SAR r7, r1, r14
  SHR r7, r10, r8
  SAR r9, r12, r14
  AND r15, r6, r5
  OR r3, r10, r8
  XOR r0, r3, r8
  OR r7, r2, r11
  FRAME
  JMP main_0
