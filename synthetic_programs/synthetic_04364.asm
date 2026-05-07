; mixed program
; initialization
  LDI r15, 8
  LDI r0, 32
  LDI r3, 0x109AF2
  LDI r2, 32
  LDI r13, 10
  LDI r1, 8
  LDI r7, 255
; palette
  LDI r3, 0x401E
  LDI r1, 1
  LDI r2, 0xAAAAAA
  STORE r3, r2
  ADD r3, r3, r1
  LDI r2, 0x000066
  STORE r3, r2
  ADD r3, r3, r1
  LDI r2, 0x000000
  STORE r3, r2
  ADD r3, r3, r1
  LDI r2, 0x550077
  STORE r3, r2
  ADD r3, r3, r1
  LDI r2, 0xFF8800
  STORE r3, r2
  ADD r3, r3, r1
  OR r7, r4, r9
  AND r4, r2, r0
  CMP r10, r6
  JNZ r10, else_0
  DIV r12, r13, r4
  JMP endif_1
else_0:
  LDI r5, 3541
  LDI r10, 0x450EF8
  LDI r21, 618
  PSETI
endif_1:
  LDI r2, 45
loop_2:
  ANDI r0, r2, 44
  MOD r5, r12, r18
  LDI r5, 0x19F140
  LDI r5, 1
  LDI r0, 0xBC0069
  PSETI
  LDI r8, 1
  SUB r2, r2, r8
  JNZ r2, loop_2
  LDI r10, 0xB11406
  STORE r10, r2
  LOAD r1, r10
  LDI r0x20D29, 3514
  STORE r29, r7
  LOAD r6, r29
  LDI r13, 0
  STORE r13, r5
  LOAD r9, r13
  LDI r8, 788
  STORE r8, r8
  LOAD r0, r8
  HALT
