; conditional logic
; initialization
  LDI r2, 255
  LDI r11, 0
  CMP r13, r8
  JNZ r13, else_0
  OR r0, r13, r10
  SUB r12, r11, r17
  JMP endif_1
else_0:
  LDI r13, 0x27095E
  LDI r12, 8
  LDI r3, 1782
  LDI r4, 0x92FF95
  CIRCLE r13, r12, r3, r4
  LDI r22, 0xD79E4B
  LDI r1, 256
  LDI r0, 128
  WPIXEL
endif_1:
  CMP r28, r0
  JZ r28, else_2
  SHL r8, r15, r5
  MUL r14, r10, r6
  JMP endif_3
else_2:
  LDI r11, 0x02D4A5
  LDI r15, 128
  LDI r1, 128
  LDI r12, 0xA33990
  LDI r11, 0xF99D04
  RECTF r11, r15, r1, r12, r11
endif_3:
  CMP r14, r15
  JNZ r14, else_4
  ADD r1, r26, r3
  OR r15, r14, r7
  SHL r1, r10, r9
  JMP endif_5
else_4:
  LDI r6, 1
  LDI r13, 3292
  LDI r15, 0xB81205
  LDI r10, 1616
  LDI r10, 8
  RECTF r6, r13, r15, r10, r10
endif_5:
  HALT
