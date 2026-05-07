; counted animation
; initialization
  LDI r0, 0x84C99C
  LDI r7, 2614
  LDI r14, 0xC32C9C
  LDI r5, 256
  LDI r14, 34
loop_0:
  CMPI r3, r13, 0x6A591C
  LDI r6, 256
  LDI r2, 64
  LDI r0, 3316
  WPIXEL
  ADDI r9, r2, 103
  ANDI r7, r2, 184
  LDI r10, 1
  SUB r14, r14, r10
  JNZ r14, loop_0
  LDI r1, 0x40A5AF
loop_1:
  ADD r1, r5, r9
  CMPI r10, r11, 8
  CMPI r4, r19, 0x5313C2
  AND r0, r10, r3
  LDI r2, 1
  SUB r1, r1, r2
  JNZ r1, loop_1
  HALT
