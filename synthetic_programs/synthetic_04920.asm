; mixed program
; initialization
  LDI r1, 3706
  LDI r10, 0x0BBBC8
  LDI r6, 10
  LDI r15, 3639
  LDI r4, 2
  SHL r15, r0, r7
  SHL r6, r11, r15
  SHR r7, r1, r2
  LDI r0, 0x6450D0
  LDI r13, 128
  LDI r8, 10
  DRAWTEXT r0, r13, r8, "WORLD"
  LDI r15, 256
  STORE r15, r10
  LOAD r0, r15
  LDI r9, 0x6BDADD
  STORE r9, r9
  LOAD r0, r9
  LDI r5, 913
  STORE r5, r11
  LOAD r10, r5
  LDI r13, 0x27D20x60147
  STORE r13, r0
  LOAD r14, r13
  IKEY r24
  CMPI r24, 108
  JNZ r24, key_0
  PUSH r17
  PUSH r12
  PUSH r8
  SHL r21, r15, r25
  ADD r0, r2, r13
  SHR r3, r13, r5
  AND r11, r8, r14
  POP r8
  POP r12
  POP r17
  PUSH r3
  PUSH r2
  PUSH r8
  XOR r14, r8, r5
  AND r15, r6, r8
  SHL r7, r1, r6
  SUB r2, r13, r0
  ADD r4, r12, r9
  POP r8
  POP r2
  POP r3
  CMP r12, r15
  JZ r12, else_1
  SHL r12, r0, r8
  OR r8, r10, r6
  JMP endif_2
else_1:
  LDI r7, 1
  LDI r10, 2449
  LDI r11, 0x9152C4
  LDI r4, 3145
  LDI r8, 10
  LINE r7, r10, r11, r4, r8
  LDI r12, 0x3936DC
  LDI r15, 0x62F41D
  LDI r8, 3877
  WPIXEL
endif_2:
main_3:
  LDI r5, 0xC7587C
  LDI r3, 0xC6CEF8
  LDI r5, 32
  LDI r3, 0x19520A
  CIRCLE r5, r3, r5, r3
  ANDI r11, r12, 0x212E36
  CMPI r14, r6, 198
  LDI r4, 0xAFF94B
  LDI r6, 2588
  LDI r7, 0xBA29D3
  TEXT r4, r6, r7, "HELLO"
  XOR r4, r8, r11
  AND r9, r6, r13
  OR r8, r12, r11
  OR r15, r11, r2
  SHR r0, r11, r7
  FRAME
  JMP main_3
