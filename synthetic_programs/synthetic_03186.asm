; input driven program
; initialization
  LDI r7, 239
  LDI r8, 0x3A662C
main_0:
  ADDI r11, r6, 0
  IKEY r4
  CMPI r4, 160
  JNZ r4, key_1
  LDI r0, 0xF30B95
  LDI r9, 10
  LDI r22, 0x854857
  TEXT r0, r9, r22, "HELLO"
  SHL r5, r8, r13
  SHL r3, r14, r6
  SHR r25, r23, r0
  CMP r23, r12
  FRAME
  JMP main_0
