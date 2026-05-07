; input driven program
; initialization
  LDI r26, 2460
  LDI r2, 2
main_0:
  ADDI r0, r13, 128
  SAR r5, r30, r14
  SHR r2, r4, r14
  SHLI r6, r1, 0xCB0196
  SHLI r1, r12, 2
  SHR r8, r9, r4
  SHR r6, r8, r0
  SHR r3, r2, r0
  SHLI r10, r11, 128
  ADDI r5, r6, 16
  FRAME
  JMP main_0
