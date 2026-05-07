; drawing loop program
; initialization
  LDI r12, 141
  LDI r7, 0x66A4D4
  LDI r3, 16
  LDI r1, 3184
  LDI r8, 215
  LDI r9, 0x9BB866
  LDI r0, 0xD43715
  LDI r6, 0
main_0:
  ADD r1, r5, r13
  SAR r4, r14, r2
  SAR r10, r8, r4
  AND r13, r2, r14
  OR r1, r15, r2
  AND r4, r6, r14
  XOR r9, r2, r11
  OR r5, r14, r4
  AND r1, r8, r10
  CMPI r8, r12, 248
  IKEY r13
  CMPI r13, 202
  JNZ r13, key_1
  FRAME
  JMP main_0
