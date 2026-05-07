; stack save/restore
; initialization
  LDI r13, 0x8EA83E
  LDI r14, 0xC83071
  LDI r4, 0x4B4D00
  PUSH r2
  PUSH r9
  OR r10, r14, r12
  SHL r1, r0, r9
  POP r9
  POP r2
  SHL r6, r12, r13
  SHR r15, r12, r1
  MUL r2, r14, r12
  MUL r1, r9, r6
  MUL r20, r14, r7
  OR r0, r12, r13
  SHL r9, r8, r12
  SUB r0, r13, r8
  PUSH r9
  PUSH r11
  PUSH r4
  ADD r11, r8, r13
  SHR r11, r2, r5
  ADD r10, r1, r13
  POP r4
  POP r11
  POP r9
  HALT
