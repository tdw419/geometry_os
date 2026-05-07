; input driven program
; initialization
  LDI r9, 256
  LDI r15, 450
  LDI r5, 3098
  LDI r2, 2
  LDI r10, 0x5A8BFC
  LDI r13, 1301
  LDI r6, 389
  LDI r1, 0xF72101
main_0:
  LDI r20, 0x975AEC
  LDI r1, 8
  LDI r12, 10
  TEXT r20, r1, r12, "HELLO"
  LDI r5, 4
  FILL r5
  CMP r8, r13
  FRAME
  JMP main_0
