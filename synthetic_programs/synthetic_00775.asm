; conditional logic
; initialization
  LDI r15, 4
  LDI r3, 1019
  LDI r9, 2294
  LDI r8, 1583
  LDI r13, 3205
  LDI r11, 10
  LDI r1, 90
  LDI r7, 4009
  CMP r6, r1
  JZ r6, else_0
  MUL r14, r3, r8
  SHL r13, r5, r8
  SHR r12, r6, r5
  JMP endif_1
else_0:
  LDI r15, 0x90CF58
  LDI r8, 2486
  LDI r15, 0xE5CD80
  LDI r14, 0x587590
  LDI r14, 0x7C435D
  RECTF r15, r8, r15, r14, r14
endif_1:
  HALT
