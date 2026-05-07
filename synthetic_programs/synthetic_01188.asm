; mixed program
; initialization
  LDI r4, 1793
  LDI r25, 0xED7C72
  LDI r1, 0x2473BE
; palette
  LDI r13, 0x24CF
  LDI r3, 1
  LDI r28, 0x8800FF
  STORE r13, r28
  ADD r13, r13, r3
  LDI r28, 0xDD0044
  STORE r13, r28
  ADD r13, r13, r3
  LDI r28, 0x000066
  STORE r13, r28
  ADD r13, r13, r3
  LDI r28, 0x0044FF
  STORE r13, r28
  ADD r13, r13, r3
  CMP r29, r2
  JZ r29, else_0
  AND r2, r12, r8
  XOR r6, r9, r0
  JMP endif_1
else_0:
  LDI r17, 0x6D474E
  LDI r1, 1922
  LDI r7, 0x28DDE8
  PSETI
  LDI r15, 8
  LDI r3, 8
  LDI r14, 4
  WPIXEL
  LDI r7, 2679
  LDI r6, 3339
  LDI r1, 0x427C12
  PSET r7, r6, r1
  LDI r5, 0x8BDCF7
  LDI r7, 2969
  LDI r9, 0xD972F5
  PSETI
endif_1:
  LDI r9, 16
loop_2:
  SHL r11, r2, r14
  AND r12, r1, r7
  ADDI r12, r5, 128
  ANDI r3, r5, 166
  LDI r12, 1
  SUB r9, r9, r12
  JNZ r9, loop_2
  MUL r5, r7, r11
  LDI r6, 4
  LDI r9, 496
  LDI r4, 1060
  LDI r0, 2749
  LDI r12, 0x0B0197
  LINE r6, r9, r4, r0, r12
main_3:
  SHR r2, r1, r4
  SAR r12, r10, r8
  LDI r3, 0x05DF35
  LDI r10, 3194
  LDI r13, 0x0962A9
  TEXT r3, r10, r13, "HELLO"
  IKEY r7
  CMPI r7, 0x389AD7
  JNZ r7, key_4
  LDI r9, 64
  LDI r9, 0x99E5D6
  LDI r2, 2455
  PSET r9, r9, r2
  SUBI r15, r8, 249
  XOR r7, r3, r29
  AND r7, r8, r5
  FRAME
  JMP main_3
