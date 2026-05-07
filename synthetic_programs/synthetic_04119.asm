; input driven program
; initialization
  LDI r1, 256
  LDI r0, 0x4B29A3
  LDI r12, 2
  LDI r6, 0x0EF034
  LDI r8, 3035
  LDI r4, 10
main_0:
  ANDI r15, r7, 3
  OR r3, r9, r12
  SHL r18, r11, r12
  SHR r8, r5, r0
  SHL r15, r9, r6
  SHL r14, r9, r15
  SHL r8, r7, r15
  SAR r7, r12, r10
  SHLI r8, r5, 256
  ADDI r3, r30, 0x035501
  CMPI r3, r12, 64
  FRAME
  JMP main_0
