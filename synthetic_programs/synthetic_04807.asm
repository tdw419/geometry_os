; mixed program
; initialization
  LDI r6, 0x6D4929
  LDI r0, 0xD3EF46
  LDI r4, 0
  LDI r5, 1
  SHL r5, r0, r11
  SHL r8, r1, r9
  SHR r27, r25, r1
  CALL func_0
func_0:
  ADD r11, r12, r26
  ADD r8, r5, r0
  RET
  LDI r4, 32
loop_1:
  LDI r10, 0xAB59C6
  LDI r2, 1769
  LDI r3, 3943
  WPIXEL
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_1
  AND r12, r11, r2
  SHL r11, r8, r12
  SHL r0, r4, r12
  SHL r13, r16, r10
  HALT
