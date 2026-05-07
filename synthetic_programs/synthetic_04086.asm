; drawing loop program
; initialization
  LDI r5, 0x8A6365
  LDI r3, 0x812CDC
  LDI r12, 546
  LDI r11, 0x31C502
  LDI r7, 0x99A8CA
  LDI r14, 2694
  LDI r15, 16
  LDI r9, 1096
main_0:
  SAR r3, r1, r8
  SAR r0, r15, r13
  SHR r8, r4, r1
  SHL r0, r3, r2
  CMPI r12, 1
  SUB r9, r5, r15
  CMPI r13, 10
  IKEY r3
  CMPI r3, 0x204F06
  JNZ r3, key_1
  FRAME
  JMP main_0
