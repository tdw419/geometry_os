; mixed program
; initialization
  LDI r3, 0
  LDI r0, 128
  LDI r13, 32
  LDI r14, 0xA6CD46
  LDI r10, 16
  LDI r9, 255
  LDI r7, 853
  LDI r5, 1883
  IKEY r7
  CMPI r7, 0x1328DB
  JNZ r7, key_0
  CMPI r5, 41
  LDI r0, 1944
  LDI r2, 0x65439D
  LDI r10, 213
  DRAWTEXT r0, r2, r10, "WORLD"
  XOR r4, r6, r12
  XOR r3, r12, r9
  AND r5, r6, r2
  CMP r0, r1
  JZ r0, else_1
  DIV r12, r14, r7
  ADD r8, r4, r2
  JMP endif_2
else_1:
  LDI r0, 3419
  LDI r11, 8
  LDI r14, 0x68B6FB
  LDI r4, 2480
  LDI r9, 2982
  LINE r0, r11, r14, r4, r9
  LDI r14, 0x0F4749
  LDI r10, 0xB16DF6
  LDI r3, 32
  LDI r15, 0x607EEE
  LDI r13, 1337
  LINE r14, r10, r3, r15, r13
endif_2:
  OR r23, r10, r6
  AND r7, r0, r11
  AND r6, r29, r10
  XOR r9, r5, r3
  CMP r13, r2
  JZ r13, else_3
  SHR r9, r13, r10
  JMP endif_4
else_3:
  LDI r10, 2
  LDI r15, 2
  LDI r3, 2094
  WPIXEL
  LDI r30, 0x7166AA
  FILL r30
  LDI r12, 4
  LDI r5, 428
  LDI r2, 10
  PSETI
  LDI r14, 0xD453EA
  LDI r4, 256
  LDI r2, 0x46F62E
  LDI r10, 3748
  CIRCLE r14, r4, r2, r10
endif_4:
  SHL r7, r0, r11
  SHR r0, r1, r2
  SAR r11, r22, r12
main_5:
  OR r3, r2, r5
  XOR r3, r10, r1
  IKEY r29
  CMPI r29, 2
  JNZ r29, key_6
  FRAME
  JMP main_5
