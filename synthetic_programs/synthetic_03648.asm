; mixed program
; initialization
  LDI r5, 10
  LDI r8, 0x18034C
  LDI r1, 1064
  LDI r4, 0xF98FA9
  LDI r11, 0x319395
  LDI r10, 0xBD8B27
  CMP r1, r12
  JZ r1, else_0
  SHL r5, r8, r2
  JMP endif_1
else_0:
  LDI r10, 0xAD2A5A
  LDI r2, 0x9CD04E
  LDI r3, 0x0B41A6
  LDI r12, 0x3EB515
  CIRCLE r10, r2, r3, r12
  LDI r14, 1795
  LDI r7, 2482
  LDI r15, 4002
  PSET r14, r7, r15
  LDI r9, 702
  LDI r13, 3213
  LDI r3, 64
  LDI r3, 0x0D81DB
  CIRCLE r9, r13, r3, r3
endif_1:
  PUSH r3
  PUSH r11
  MOD r11, r5, r7
  XOR r15, r2, r5
  MOD r1, r0, r13
  SHL r0, r4, r15
  POP r11
  POP r3
  CALL func_2
func_2:
  SHL r8, r2, r23
  XOR r2, r0, r10
  AND r13, r4, r6
  OR r4, r6, r7
  RET
  XOR r11, r15, r5
  AND r15, r3, r14
  OR r28, r12, r23
  OR r1, r10, r0
  PUSH r14
  PUSH r6
  ADD r3, r15, r10
  XOR r14, r4, r0
  SUB r1, r2, r8
  DIV r7, r14, r3
  POP r6
  POP r14
main_3:
  IKEY r15
  CMPI r15, 0x5F7EFE
  JNZ r15, key_4
  ADD r10, r14, r3
  ADDI r2, r5, 0x867E46
  SHL r18, r12, r1
  FRAME
  JMP main_3
