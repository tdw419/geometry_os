; mixed program
; initialization
  LDI r9, 32
  LDI r0, 8
  LDI r5, 0x4F0CC1
  LDI r1, 0xA89750
  LDI r7, 0xEC0B2A
  LDI r4, 0x029CAA
  CMPI r4, 22
  SAR r5, r6, r13
  SHR r8, r9, r7
  SAR r0, r14, r12
  SHLI r5, r1, 0x30C6C4
  LDI r11, 4
loop_0:
  LDI r15, 4
  LDI r4, 4
  LDI r0, 3996
  PSETI
  LDI r8, 128
  FILL r8
  LDI r15, 1
  SUB r11, r11, r15
  JNZ r11, loop_0
  CALL func_1
func_1:
  XOR r4, r1, r13
  MUL r4, r14, r5
  XOR r10, r2, r9
  RET
  PUSH r8
  PUSH r11
  DIV r8, r15, r7
  MUL r5, r2, r8
  DIV r9, r15, r7
  SHR r14, r7, r0
  SHL r8, r5, r6
  POP r11
  POP r8
main_2:
  XOR r6, r7, r0
  ADD r18, r10, r28
  LDI r3, 32
  LDI r2, 256
  LDI r6, 0xC187AE
  DRAWTEXT r3, r2, r6, "WORLD"
  LDI r6, 1
  LDI r6, 2162
  LDI r12, 2307
  TEXT r6, r6, r12, "HELLO"
  FRAME
  JMP main_2
