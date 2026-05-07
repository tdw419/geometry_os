; mixed program
; initialization
  LDI r12, 0xF21C5A
  LDI r10, 4
; palette
  LDI r15, 0x211C
  LDI r14, 1
  LDI r10, 0xAAFF00
  STORE r15, r10
  ADD r15, r15, r14
  LDI r10, 0xFFEE00
  STORE r15, r10
  ADD r15, r15, r14
  LDI r10, 0x888800
  STORE r15, r10
  ADD r15, r15, r14
  LDI r10, 0x00FF44
  STORE r15, r10
  ADD r15, r15, r14
  LDI r10, 0x00FFAA
  STORE r15, r10
  ADD r15, r15, r14
  LDI r10, 4
  STORE r10, r0
  LOAD r12, r10
  LDI r11, 1
  STORE r11, r1
  LOAD r4, r11
  LDI r11, 3559
  STORE r11, r9
  LOAD r8, r11
  LDI r14, 4
  STORE r14, r29
  LOAD r9, r14
  LDI r27, 32
loop_0:
  DIV r7, r20, r4
  SHL r13, r6, r4
  LDI r8, 1
  SUB r27, r27, r8
  JNZ r27, loop_0
  IKEY r10
  CMPI r10, 32
  JNZ r10, key_1
  CMP r3, r18
  JZ r3, else_2
  OR r8, r12, r15
  JMP endif_3
else_2:
  LDI r8, 10
  LDI r4, 0xD12D8B
  LDI r7, 0xB80373
  LDI r6, 4
  LDI r12, 3038
  LINE r8, r4, r7, r6, r12
  LDI r13, 1262
  LDI r2, 957
  LDI r21, 3715
  LDI r8, 1574
  LDI r18, 256
  RECTF r13, r2, r21, r8, r18
endif_3:
  LDI r5, 32
loop_4:
  CMPI r9, r11, 202
  XOR r3, r2, r5
  LDI r0, 1
  SUB r5, r5, r0
  JNZ r5, loop_4
main_5:
  CMPI r4, 0x0773F4
  SHLI r11, r15, 4
  SHLI r4, r3, 0x27F511
  SHLI r13, r10, 0xFF8EFF
  FRAME
  JMP main_5
