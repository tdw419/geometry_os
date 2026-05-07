; stack save/restore
; initialization
  LDI r9, 0xD40EF7
  LDI r2, 64
  LDI r26, 0xCE293D
  LDI r10, 0xA37C10
  PUSH r13
  DIV r0, r13, r28
  XOR r5, r7, r12
  MUL r4, r9, r8
  POP r13
  XOR r0, r6, r2
  SHR r7, r9, r11
  SHR r2, r18, r15
  SHL r0, r1, r6
  SHR r8, r6, r4
  AND r9, r15, r5
  XOR r2, r1, r5
  PUSH r12
  PUSH r12
  SHL r7, r2, r15
  SHR r12, r11, r7
  POP r12
  POP r12
  HALT
