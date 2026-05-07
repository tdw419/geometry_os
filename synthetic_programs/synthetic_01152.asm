; mixed program
; initialization
  LDI r0, 0xB9E16A
  LDI r9, 255
  LDI r7, 32
  LDI r1, 0x1C409C
  LDI r4, 0x6EFAB1
  LDI r5, 1562
  LDI r13, 4020
  LDI r10, 0xAE29A7
  CMP r8, r4
  JZ r8, else_0
  ADD r12, r8, r5
  OR r12, r13, r0
  JMP endif_1
else_0:
  LDI r14, 9
  LDI r12, 0x741209
  LDI r13, 128
  WPIXEL
endif_1:
  PUSH r10
  PUSH r13
  SHL r9, r14, r11
  XOR r12, r2, r6
  SUB r0, r1, r15
  MOD r9, r2, r19
  MOD r14, r6, r9
  POP r13
  POP r10
  OR r6, r8, r14
  AND r2, r0, r10
  OR r13, r11, r12
  CMP r3, r0
  JNZ r3, else_2
  OR r13, r15, r8
  ADD r13, r1, r10
  SHR r8, r14, r12
  AND r12, r2, r9
  JMP endif_3
else_2:
  LDI r3, 256
  LDI r0, 4
  LDI r14, 64
  PSETI
  LDI r7, 16
  LDI r17, 1431
  LDI r9, 2
  PSET r7, r17, r9
endif_3:
main_4:
  CMPI r12, 0xF92A46
  LDI r14, 3645
  LDI r4, 0xE9897B
  LDI r13, 1
  WPIXEL
  IKEY r13
  CMPI r13, 0
  JNZ r13, key_5
  LDI r13, 0x1927EC
  LDI r3, 0xF3CF96
  LDI r11, 16
  LDI r12, 3543
  LDI r6, 64
  LINE r13, r3, r11, r12, r6
  FRAME
  JMP main_4
