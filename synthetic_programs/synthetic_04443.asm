; mixed program
; initialization
  LDI r9, 1
  LDI r12, 10
  LDI r14, 0xC67314
  LDI r13, 0x2C7AE2
  LDI r2, 0x529CDE
  LDI r5, 0xDAEAD3
  LDI r10, 0x4E1CEC
; palette
  LDI r3, 0x2459
  LDI r14, 1
  LDI r8, 0x00FF00
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0xAA00AA
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x550077
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FFAA
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x880088
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00AAFF
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x0000CC
  STORE r3, r8
  ADD r3, r3, r14
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r14
  IKEY r6
  CMPI r6, 0x9E38E8
  JNZ r6, key_0
  LDI r11, 3648
  LDI r8, 1
  LDI r13, 2
  WPIXEL
  PUSH r0
  PUSH r6
  PUSH r10
  PUSH r6
  OR r7, r8, r5
  ADD r20, r4, r7
  MUL r13, r0, r4
  MUL r9, r8, r12
  POP r6
  POP r10
  POP r6
  POP r0
  SHR r9, r10, r11
  SHLI r12, r0, 1
  LDI r6, 8
loop_1:
  ADDI r3, r8, 192
  LDI r2, 3833
  LDI r6, 3285
  LDI r1, 0xD9DF72
  LDI r15, 2537
  LDI r3, 0xDE4703
  RECTF r2, r6, r1, r15, r3
  LDI r0, 4
  LDI r19, 2
  LDI r2, 0xE0708E
  PSETI
  ANDI r12, r15, 0x680F44
  LDI r10, 1
  SUB r6, r6, r10
  JNZ r6, loop_1
  PUSH r4
  PUSH r11
  MOD r14, r11, r9
  MUL r0, r14, r3
  POP r11
  POP r4
  LDI r8, 0x93C81F
  STORE r8, r3
  LOAD r2, r8
  LDI r9, 0xC42D06
  STORE r9, r5
  LOAD r2, r9
  LDI r15, 0x5FB9D0
  STORE r15, r25
  LOAD r12, r15
  LDI r10, 2216
  STORE r10, r7
  LOAD r14, r10
  LDI r14, 0xF85D12
  STORE r14, r11
  LOAD r15, r14
main_2:
  CMPI r12, 256
  SHR r0, r14, r3
  SHR r3, r6, r12
  SHL r5, r9, r6
  SHLI r12, r11, 0xFDBDEB
  LDI r11, 0xC19E33
  LDI r11, 0x24C9A9
  LDI r4, 711
  PSET r11, r11, r4
  CMPI r1, 189
  FRAME
  JMP main_2
