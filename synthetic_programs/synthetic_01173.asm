; input driven program
; initialization
  LDI r4, 8
  LDI r8, 3151
  LDI r6, 3619
main_0:
  LDI r3, 64
  LDI r0, 3635
  LDI r7, 255
  TEXT r3, r0, r7, "HELLO"
  SAR r2, r5, r8
  SAR r5, r15, r19
  SHR r8, r7, r15
  FRAME
  JMP main_0
