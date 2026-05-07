; mixed program
; initialization
  LDI r14, 2
  LDI r1, 0xE6E4ED
  LDI r8, 64
  LDI r2, 2379
  LDI r3, 3267
  LDI r0, 0xA0EC4E
  LDI r7, 1068
; palette
  LDI r9, 0x30E8
  LDI r7, 1
  LDI r15, 0x00FF44
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x888800
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x550077
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0x0044FF
  STORE r9, r15
  ADD r9, r9, r7
  LDI r15, 0xAAAAAA
  STORE r9, r15
  ADD r9, r9, r7
  LDI r14, 255
loop_0:
  SUBI r4, r14, 220
  LDI r13, 1
  SUB r14, r14, r13
  JNZ r14, loop_0
  CMP r10, r3
  JNZ r10, else_1
  SHL r2, r5, r1
  SHL r15, r3, r14
  JMP endif_2
else_1:
  LDI r14, 2038
  LDI r1, 2
  LDI r4, 912
  LDI r7, 10
  CIRCLE r14, r1, r4, r7
  LDI r8, 2980
  LDI r9, 3614
  LDI r4, 3997
  PSETI
  LDI r1, 4
  LDI r0, 0xF84CBF
  LDI r15, 32
  PSETI
  LDI r4, 64
  LDI r10, 2431
  LDI r0, 0xF787FA
  WPIXEL
endif_2:
  OR r13, r7, r8
  OR r11, r2, r10
  IKEY r15
  CMPI r15, 0xE76D0F
  JNZ r15, key_3
  AND r5, r6, r9
  AND r11, r9, r10
  AND r0, r13, r12
  OR r5, r9, r10
  LDI r10, 0xB94EB8
  STORE r10, r6
  LOAD r9, r10
  LDI r8, 0xF3F3FE
  STORE r8, r0
  LOAD r7, r8
  LDI r13, 1631
  STORE r13, r12
  LOAD r15, r13
  LDI r8, 2556
  STORE r8, r4
  LOAD r12, r8
main_4:
  CMPI r20, r15, 2
  SHL r1, r4, r2
  SHLI r4, r30, 0xB68948
  LDI r10, 0xE06C59
  LDI r13, 1510
  LDI r15, 0xEF45A1
  DRAWTEXT r10, r13, r15, "WORLD"
  CMPI r3, 0x9EF023
  SHL r7, r12, r9
  SAR r16, r4, r2
  CMP r3, r15
  FRAME
  JMP main_4
