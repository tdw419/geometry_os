; mixed program
; initialization
  LDI r28, 0xFAAA3A
  LDI r4, 32
  CMP r10, r3
  SHR r5, r0, r8
  SAR r9, r1, r3
  SHL r3, r5, r2
  SAR r9, r12, r4
  OR r11, r2, r14
  OR r2, r3, r9
  PUSH r10
  PUSH r1
  MUL r3, r2, r14
  MOD r3, r2, r10
  ADD r12, r3, r15
  MUL r14, r8, r2
  POP r1
  POP r10
  CMP r15, r0
  JNZ r15, else_0
  SHR r25, r10, r5
  ADD r14, r6, r11
  SHR r15, r14, r2
  SUB r7, r3, r11
  JMP endif_1
else_0:
  LDI r12, 8
  FILL r12
  LDI r14, 0xB9225A
  LDI r3, 65
  LDI r7, 0x5BA3E5
  LDI r2, 865
  CIRCLE r14, r3, r7, r2
endif_1:
  CMP r6, r2
  JZ r6, else_2
  DIV r4, r6, r3
  JMP endif_3
else_2:
  LDI r12, 0x21F8B5
  LDI r6, 64
  LDI r13, 3055
  LDI r6, 255
  CIRCLE r12, r6, r13, r6
  LDI r14, 0x116D0C
  LDI r25, 0x3EF2BA
  LDI r7, 3839
  WPIXEL
  LDI r3, 256
  FILL r3
endif_3:
  HALT
