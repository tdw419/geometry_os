; drawing loop program
; initialization
  LDI r11, 3695
  LDI r9, 0x50521B
  LDI r5, 128
  LDI r18, 1605
  LDI r0, 0x75B69F
  LDI r14, 16
  LDI r12, 32
  LDI r2, 0x6760A3
main_0:
  MOD r8, r12, r1
  CMPI r4, r8, 24
  CMPI r3, 176
  CMP r10, r6
  SHL r14, r9, r12
  SHR r12, r11, r8
  SHLI r10, r0, 2
  SHL r14, r0, r4
  SUB r6, r4, r14
  FRAME
  JMP main_0
