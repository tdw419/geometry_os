; mixed program
; initialization
  LDI r3, 0x24036E
  LDI r11, 0x54B069
  LDI r2, 2911
  LDI r13, 3373
  LDI r5, 0x796E5C
  LDI r10, 256
; palette
  LDI r9, 0x4034
  LDI r0, 1
  LDI r15, 0x550077
  STORE r9, r15
  ADD r9, r9, r0
  LDI r15, 0x550077
  STORE r9, r15
  ADD r9, r9, r0
  LDI r15, 0x550077
  STORE r9, r15
  ADD r9, r9, r0
  LDI r15, 0xFF0000
  STORE r9, r15
  ADD r9, r9, r0
  CMP r8, r15
  JZ r8, else_0
  MOD r5, r14, r8
  JMP endif_1
else_0:
  LDI r11, 32
  LDI r7, 1
  LDI r8, 10
  PSETI
  LDI r11, 16
  LDI r11, 761
  LDI r4, 2
  LDI r6, 3933
  CIRCLE r11, r11, r4, r6
  LDI r15, 2
  LDI r4, 2326
  LDI r3, 2599
  WPIXEL
endif_1:
  LDI r9, 255
  LDI r10, 0x055DDA
  LDI r10, 111
  LDI r8, 32
  CIRCLE r9, r10, r10, r8
  CALL func_2
func_2:
  SUB r1, r14, r13
  SHL r2, r3, r15
  ADD r30, r2, r8
  XOR r3, r15, r10
  SHR r13, r10, r0
  RET
  CMP r27, r11
  JZ r27, else_3
  ADD r10, r9, r2
  SHL r12, r10, r2
  SUB r15, r31, r1
  JMP endif_4
else_3:
  LDI r12, 32
  FILL r12
  LDI r12, 2
  LDI r6, 2
  LDI r6, 3134
  PSETI
  LDI r14, 0x70925A
  LDI r11, 16
  LDI r9, 1379
  LDI r1, 0xE3E748
  LDI r6, 0x3B0736
  LINE r14, r11, r9, r1, r6
endif_4:
  LDI r12, 0
loop_5:
  SUBI r13, r5, 0xB6C259
  LDI r0, 2946
  LDI r14, 0x458842
  LDI r1, 8
  LDI r0, 1752
  CIRCLE r0, r14, r1, r0
  SUBI r7, r8, 31
  SUBI r12, r4, 226
  LDI r1, 1
  SUB r12, r12, r1
  JNZ r12, loop_5
  LDI r13, 8
loop_6:
  ADDI r2, r6, 14
  LDI r4, 0x566697
  LDI r30, 3999
  LDI r14, 2588
  WPIXEL
  ANDI r8, r2, 0x40AE80
  SUBI r3, r6, 8
  LDI r1, 1
  SUB r13, r13, r1
  JNZ r13, loop_6
  CALL func_7
func_7:
  SHL r8, r0, r6
  SUB r3, r1, r8
  DIV r14, r6, r10
  RET
  PUSH r4
  PUSH r11
  PUSH r12
  OR r15, r9, r14
  MOD r4, r5, r12
  MOD r10, r13, r14
  SUB r15, r12, r9
  POP r12
  POP r11
  POP r4
  HALT
