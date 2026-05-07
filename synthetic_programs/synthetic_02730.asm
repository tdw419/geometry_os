; input driven program
; initialization
  LDI r3, 16
  LDI r4, 0xF4CFDC
  LDI r5, 128
  LDI r14, 128
  LDI r0, 256
  LDI r9, 716
  LDI r11, 0xE60F28
  LDI r22, 255
main_0:
  CMP r3, r8
  SUBI r13, r1, 0
  SAR r15, r0, r8
  SHL r16, r5, r14
  ADDI r14, r6, 255
  IKEY r12
  CMPI r12, 56
  JNZ r12, key_1
  FRAME
  JMP main_0
