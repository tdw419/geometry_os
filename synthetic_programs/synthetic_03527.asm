; mixed program
; initialization
  LDI r15, 10
  LDI r3, 16
  LDI r11, 255
  LDI r10, 3916
  LDI r5, 0x2B48B1
; palette
  LDI r1, 0x8065
  LDI r2, 1
  LDI r17, 0x00FFAA
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0xAAFF00
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x0044FF
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x008888
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x000000
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x00FF44
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x000066
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x0000CC
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x0000CC
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0xFFFF00
  STORE r1, r17
  ADD r1, r1, r2
  LDI r17, 0x008888
  STORE r1, r17
  ADD r1, r1, r2
  AND r8, r5, r11
  AND r11, r6, r9
  SHL r7, r11, r6
  SHR r3, r8, r7
  LDI r15, 0x0F6EC2
  STORE r15, r20
  LOAD r5, r15
  LDI r2, 255
  STORE r2, r2
  LOAD r15, r2
  LDI r1, 0x3FEB2B
  STORE r1, r12
  LOAD r8, r1
  LDI r3, 64
  STORE r3, r8
  LOAD r14, r3
  SUB r10, r23, r1
  CALL func_0
func_0:
  AND r6, r11, r14
  MOD r4, r15, r2
  XOR r10, r13, r31
  MOD r11, r14, r5
  ADD r13, r4, r11
  RET
  CMP r7, r12
  JNZ r7, else_1
  XOR r13, r6, r5
  MOD r5, r7, r10
  SUB r5, r10, r6
  MUL r8, r2, r9
  JMP endif_2
else_1:
  LDI r10, 1545
  LDI r8, 2909
  LDI r9, 2
  PSETI
endif_2:
  IKEY r4
  CMPI r4, 213
  JNZ r4, key_3
  LDI r0, 0x0C78F3
  LDI r14, 16
  LDI r0, 0x3A75E8
  TEXT r0, r14, r0, "HELLO"
  HALT
