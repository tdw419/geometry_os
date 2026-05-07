; stack save/restore
; initialization
  LDI r10, 2784
  LDI r5, 128
  PUSH r9
  PUSH r10
  PUSH r12
  AND r5, r12, r3
  ADD r0, r10, r9
  POP r12
  POP r10
  POP r9
  DIV r0, r1, r6
  MUL r10, r15, r9
  MUL r11, r7, r16
  SHL r2, r6, r13
  XOR r4, r0, r13
  PUSH r0
  PUSH r4
  PUSH r24
  PUSH r1
  SHL r13, r15, r7
  DIV r9, r12, r2
  POP r1
  POP r24
  POP r4
  POP r0
  HALT
