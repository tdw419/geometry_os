; conditional logic
; initialization
  LDI r0, 1856
  LDI r8, 1448
  LDI r17, 2492
  CMP r8, r10
  JZ r8, else_0
  MUL r12, r2, r11
  MUL r2, r14, r6
  JMP endif_1
else_0:
  LDI r4, 2
  LDI r1, 32
  LDI r0, 931
  LDI r15, 255
  LDI r10, 0x156FE0
  LINE r4, r1, r0, r15, r10
  LDI r5, 2
  FILL r5
  LDI r14, 3428
  LDI r3, 0x00EBCF
  LDI r15, 0x51D154
  PSETI
endif_1:
  CMP r0, r7
  JNZ r0, else_2
  ADD r1, r0, r3
  ADD r1, r5, r0
  JMP endif_3
else_2:
  LDI r31, 8
  LDI r5, 0
  LDI r12, 0x900F7C
  WPIXEL
  LDI r11, 3017
  LDI r15, 0xF4DC32
  LDI r18, 2
  WPIXEL
endif_3:
  HALT
