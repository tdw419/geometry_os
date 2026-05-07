; stack save/restore
; initialization
  LDI r4, 3994
  LDI r3, 0x8EBDC6
  LDI r12, 0xAA3BBF
  PUSH r7
  SUB r1, r0, r14
  SHR r3, r0, r1
  POP r7
  DIV r2, r4, r3
  MUL r4, r8, r2
  OR r0, r13, r9
  SUB r0, r11, r10
  SHR r2, r7, r5
  PUSH r8
  PUSH r4
  MUL r12, r15, r5
  SHR r8, r3, r7
  XOR r10, r5, r14
  POP r4
  POP r8
  HALT
