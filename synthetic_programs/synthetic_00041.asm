; conditional logic
; initialization
  LDI r7, 3144
  LDI r6, 3566
  LDI r10, 255
  LDI r15, 0xED0255
  LDI r3, 16
  CMP r12, r1
  JZ r12, else_0
  XOR r0, r4, r9
  SHR r14, r10, r9
  JMP endif_1
else_0:
  LDI r27, 3311
  LDI r9, 0x1B3380
  LDI r11, 0x907DBA
  PSETI
  LDI r13, 10
  LDI r12, 1420
  LDI r6, 2951
  WPIXEL
  LDI r9, 1100
  LDI r0, 0xF930EA
  LDI r4, 0xD4EB01
  WPIXEL
  LDI r13, 16
  LDI r14, 16
  LDI r15, 64
  WPIXEL
endif_1:
  HALT
