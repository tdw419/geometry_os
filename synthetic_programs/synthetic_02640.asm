; mixed program
; initialization
  LDI r26, 0xEA6624
  LDI r1, 3448
  LDI r8, 2
  LDI r5, 225
  LDI r15, 0xDAD042
  LDI r3, 3780
  LDI r14, 3492
  LDI r0, 1549
  LDI r9, 128
loop_0:
  LDI r3, 0x3F76BD
  LDI r15, 256
  LDI r3, 3365
  PSET r3, r15, r3
  CMPI r9, r14, 1
  LDI r4, 1
  SUB r9, r9, r4
  JNZ r9, loop_0
  SHLI r14, r13, 0xA37431
  SHL r16, r4, r6
  SHLI r3, r5, 5
  LDI r0, 2769
  LDI r6, 2574
  LDI r12, 633
  PSETI
  IKEY r7
  CMPI r7, 0xD1A4DF
  JNZ r7, key_1
  LDI r10, 0x2A5528
loop_2:
  AND r14, r1, r7
  LDI r7, 1
  SUB r10, r10, r7
  JNZ r10, loop_2
  CALL func_3
func_3:
  ADD r2, r14, r11
  XOR r4, r8, r10
  ADD r3, r7, r1
  RET
  HALT
