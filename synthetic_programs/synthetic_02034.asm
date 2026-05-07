; input driven program
; initialization
  LDI r13, 1174
  LDI r4, 0x3EB90A
  LDI r2, 359
  LDI r6, 0x318C65
  LDI r11, 8
  LDI r10, 1182
  LDI r15, 507
  LDI r9, 0xE798F7
main_0:
  XOR r0, r15, r14
  MUL r12, r8, r4
  LDI r3, 184
  LDI r5, 1298
  LDI r7, 256
  TEXT r3, r5, r7, "HELLO"
  FRAME
  JMP main_0
