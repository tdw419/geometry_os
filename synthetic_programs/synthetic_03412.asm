; mixed program
; initialization
  LDI r15, 1304
  LDI r6, 256
  LDI r11, 0x500C10
  LDI r7, 0xF7C81A
  LDI r8, 8
  LDI r1, 2264
  LDI r13, 255
  LDI r5, 256
  SHR r11, r5, r15
  SHR r8, r2, r3
  SHLI r2, r1, 0x8B00AF
  SHL r12, r6, r3
  CMPI r2, 4
  PUSH r2
  PUSH r13
  XOR r11, r0, r1
  MUL r13, r15, r9
  MOD r0, r2, r8
  AND r3, r14, r2
  SHR r7, r11, r2
  POP r13
  POP r2
  LDI r7, 35
loop_0:
  LDI r1, 0xC8B30D
  LDI r6, 2101
  LDI r10, 0x5D2862
  PSET r1, r6, r10
  LDI r12, 0x89201D
  LDI r7, 0x4F6922
  LDI r17, 256
  WPIXEL
  LDI r12, 1
  SUB r7, r7, r12
  JNZ r7, loop_0
  CALL func_1
func_1:
  MUL r0, r7, r14
  ADD r14, r11, r6
  RET
main_2:
  CMP r5, r12
  IKEY r0
  CMPI r0, 16
  JNZ r0, key_3
  CMPI r7, r10, 255
  AND r11, r14, r5
  OR r1, r14, r3
  CMP r12, r0
  FRAME
  JMP main_2
