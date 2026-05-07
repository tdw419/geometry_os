; input driven program
; initialization
  LDI r29, 256
  LDI r6, 0x8A2E69
  LDI r11, 949
  LDI r12, 255
main_0:
  CMPI r4, r2, 0x5F7A18
  LDI r12, 0x136D4C
  LDI r3, 4
  LDI r2, 255
  TEXT r12, r3, r2, "HELLO"
  CMP r15, r3
  SHR r11, r2, r13
  SAR r15, r10, r1
  SAR r31, r1, r10
  ADDI r12, r0, 2
  FRAME
  JMP main_0
