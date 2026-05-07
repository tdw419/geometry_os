; mixed program
; initialization
  LDI r9, 8
  LDI r15, 8
  LDI r8, 128
  LDI r1, 0x047585
  LDI r12, 0xDE6866
  LDI r14, 4
  LDI r7, 2880
  DRAWTEXT r12, r14, r7, "WORLD"
  LDI r12, 0x338BC8
loop_0:
  LDI r14, 0xB88E67
  LDI r11, 356
  LDI r13, 0x71F26F
  WPIXEL
  LDI r14, 0x4961C1
  LDI r4, 853
  LDI r9, 0xC9DA11
  PSETI
  LDI r6, 1
  SUB r12, r12, r6
  JNZ r12, loop_0
  CMP r7, r9
  CMP r8, r4
  JZ r8, else_1
  MUL r7, r15, r8
  XOR r8, r9, r11
  XOR r14, r3, r6
  JMP endif_2
else_1:
  LDI r9, 1177
  LDI r3, 2
  LDI r8, 128
  LDI r28, 3897
  CIRCLE r9, r3, r8, r28
endif_2:
  SHLI r8, r24, 255
  SAR r5, r7, r3
  SHL r4, r5, r9
  IKEY r11
  CMPI r11, 0x4508AE
  JNZ r11, key_3
  HALT
