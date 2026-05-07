; mixed program
; initialization
  LDI r11, 2885
  LDI r2, 0xD17FF1
  LDI r13, 0xF0A884
  LDI r12, 0x114F15
  LDI r1, 2344
  LDI r0, 256
  LDI r5, 327
  LDI r4, 0xE50476
  SHR r9, r4, r2
  LDI r11, 0xABE51B
loop_0:
  OR r8, r13, r2
  LDI r10, 1955
  LDI r12, 0x2606B5
  LDI r14, 0xCE51FD
  LDI r13, 128
  CIRCLE r10, r12, r14, r13
  ADDI r25, r7, 0x9A7631
  AND r7, r22, r2
  LDI r13, 1
  SUB r11, r11, r13
  JNZ r11, loop_0
  XOR r3, r5, r12
  OR r20, r22, r2
  XOR r6, r14, r0
  CMP r0, r14
  JZ r0, else_1
  SHR r4, r11, r3
  JMP endif_2
else_1:
  LDI r6, 0xD7B6CB
  LDI r9, 1
  LDI r10, 0xE74D2F
  LDI r5, 0x33EA7F
  LDI r3, 0xAD4BD9
  RECTF r6, r9, r10, r5, r3
endif_2:
  LDI r10, 10
  STORE r10, r14
  LOAD r12, r10
  LDI r9, 4
  STORE r9, r2
  LOAD r12, r9
  LDI r13, 64
  STORE r13, r4
  LOAD r10, r13
  LDI r25, 110
  STORE r25, r3
  LOAD r13, r25
  LDI r13, 128
  LDI r15, 1
  LDI r11, 340
  TEXT r13, r15, r11, "HELLO"
  LDI r23, 64
loop_3:
  LDI r13, 0
  LDI r1, 0xA6A060
  LDI r12, 2835
  WPIXEL
  OR r11, r10, r7
  ADD r2, r9, r21
  LDI r6, 1
  SUB r23, r23, r6
  JNZ r23, loop_3
main_4:
  ADDI r3, r7, 152
  XOR r15, r2, r3
  AND r15, r10, r2
  OR r1, r11, r14
  OR r5, r10, r9
  MUL r5, r0, r2
  CMP r7, r4
  AND r2, r25, r8
  OR r2, r11, r1
  OR r7, r14, r22
  ANDI r1, r13, 0xE227A9
  FRAME
  JMP main_4
