; mixed program
; initialization
  LDI r12, 256
  LDI r14, 32
  LDI r11, 4
  LDI r13, 4
  LDI r9, 0x5CC4D8
  LDI r6, 244
  LDI r10, 1913
; palette
  LDI r3, 0x22FF
  LDI r13, 1
  LDI r8, 0x008888
  STORE r3, r8
  ADD r3, r3, r13
  LDI r8, 0xFFFF00
  STORE r3, r8
  ADD r3, r3, r13
  LDI r8, 0x0000FF
  STORE r3, r8
  ADD r3, r3, r13
  LDI r8, 0x00FF44
  STORE r3, r8
  ADD r3, r3, r13
  CALL func_0
func_0:
  XOR r3, r4, r22
  MUL r9, r1, r6
  OR r0, r3, r13
  RET
  LDI r1, 10
loop_1:
  ANDI r3, r15, 178
  LDI r3, 2
  FILL r3
  SUB r0, r15, r7
  SUBI r8, r12, 168
  LDI r7, 1
  SUB r1, r1, r7
  JNZ r1, loop_1
  CALL func_2
func_2:
  DIV r3, r10, r2
  MUL r7, r4, r10
  SHR r11, r8, r7
  DIV r10, r9, r14
  RET
  AND r11, r7, r12
  XOR r0, r4, r11
  XOR r11, r4, r6
  XOR r9, r4, r11
  PUSH r10
  PUSH r11
  AND r13, r2, r9
  SHR r10, r6, r0
  MOD r20, r29, r15
  XOR r14, r5, r8
  POP r11
  POP r10
  MOD r6, r13, r4
  LDI r2, 2
loop_3:
  LDI r10, 148
  LDI r6, 0xFAC249
  LDI r11, 0x1B17EB
  LDI r3, 3524
  LDI r0, 16
  LINE r10, r6, r11, r3, r0
  SUB r11, r15, r9
  LDI r14, 1
  SUB r2, r2, r14
  JNZ r2, loop_3
  HALT
