; mixed program
; initialization
  LDI r15, 255
  LDI r11, 0x5D35B6
  LDI r14, 1056
  LDI r8, 0xD76168
  LDI r30, 128
  LDI r0, 0x7DD919
  LDI r7, 0xDA2308
; palette
  LDI r9, 0x8089
  LDI r13, 1
  LDI r0, 0x0044FF
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x0000FF
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x00FF44
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x000066
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x000066
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0xFFFF00
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0xAAAAAA
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0xFF0000
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x00FFAA
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0xAAAAAA
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x00FFAA
  STORE r9, r0
  ADD r9, r9, r13
  LDI r0, 0x0000CC
  STORE r9, r0
  ADD r9, r9, r13
  CMP r29, r8
  JNZ r29, else_0
  ADD r3, r4, r11
  JMP endif_1
else_0:
  LDI r14, 64
  LDI r5, 2972
  LDI r4, 0
  LDI r3, 956
  LDI r15, 1131
  LINE r14, r5, r4, r3, r15
  LDI r4, 2
  LDI r9, 2146
  LDI r1, 0x2F48E6
  WPIXEL
  LDI r12, 4
  LDI r4, 4025
  LDI r10, 0x7E9DDD
  WPIXEL
  LDI r2, 10
  LDI r2, 970
  LDI r12, 335
  LDI r3, 255
  CIRCLE r2, r2, r12, r3
endif_1:
  SAR r9, r0, r31
  SHLI r6, r2, 0xDF93EB
  SAR r6, r15, r5
  SHLI r10, r1, 0x5BE8A8
  LDI r7, 64
  LDI r6, 2
  LDI r12, 3923
  LDI r1, 0x0539A8
  CIRCLE r7, r6, r12, r1
  OR r1, r5, r10
  AND r10, r11, r9
  XOR r4, r6, r0
  LDI r13, 32
  STORE r13, r7
  LOAD r12, r13
  LDI r8, 2
  STORE r8, r13
  LOAD r9, r8
  AND r15, r12, r1
  LDI r4, 18
loop_2:
  LDI r6, 0
  LDI r14, 1620
  LDI r3, 64
  LDI r9, 0x791AE7
  LDI r18, 0xE798C2
  RECTF r6, r14, r3, r9, r18
  LDI r11, 3745
  LDI r1, 3240
  LDI r14, 4
  PSETI
  LDI r5, 1
  SUB r4, r4, r5
  JNZ r4, loop_2
  AND r5, r14, r7
  XOR r11, r13, r10
  AND r14, r15, r1
  XOR r5, r15, r8
main_3:
  CMPI r15, r10, 0x23769C
  CMPI r10, 26
  ANDI r7, r9, 16
  LDI r6, 0
  LDI r15, 3115
  LDI r15, 2586
  TEXT r6, r15, r15, "HELLO"
  FRAME
  JMP main_3
