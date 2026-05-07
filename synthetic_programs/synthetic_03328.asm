; mixed program
; initialization
  LDI r9, 3872
  LDI r2, 0xAA198B
  LDI r12, 1211
  LDI r7, 16
  LDI r1, 128
  LDI r15, 0x2A5294
loop_0:
  SUBI r10, r1, 256
  OR r14, r12, r15
  MOD r0, r9, r14
  LDI r13, 1
  SUB r15, r15, r13
  JNZ r15, loop_0
  PUSH r15
  PUSH r4
  DIV r14, r5, r2
  SUB r12, r13, r5
  POP r4
  POP r15
  PUSH r14
  PUSH r5
  PUSH r15
  XOR r14, r18, r8
  MOD r8, r7, r1
  SHR r1, r3, r11
  AND r8, r14, r1
  SHR r11, r13, r3
  POP r15
  POP r5
  POP r14
  LDI r9, 0x0024CD
loop_1:
  SUBI r2, r7, 128
  LDI r0, 128
  LDI r14, 1
  LDI r13, 255
  WPIXEL
  ANDI r15, r5, 255
  ADD r13, r11, r14
  LDI r1, 1
  SUB r9, r9, r1
  JNZ r9, loop_1
  CMP r10, r2
  LDI r6, 0xA9EC47
loop_2:
  SUBI r0, r6, 2
  ANDI r11, r6, 0xE28641
  LDI r12, 1
  SUB r6, r6, r12
  JNZ r6, loop_2
  HALT
