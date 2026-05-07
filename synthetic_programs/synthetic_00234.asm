; mixed program
; initialization
  LDI r1, 1707
  LDI r0, 0xB6EDBE
  LDI r10, 0x959C0D
  LDI r2, 319
  SHR r1, r3, r11
  SAR r14, r11, r15
  SHLI r4, r10, 64
  SHL r2, r15, r6
  LDI r13, 2908
  LDI r3, 10
  LDI r14, 649
  TEXT r13, r3, r14, "HELLO"
  LDI r3, 2689
  STORE r3, r10
  LOAD r9, r3
  LDI r9, 256
  STORE r9, r9
  LOAD r10, r9
  AND r13, r11, r6
  LDI r2, 0x24E498
  STORE r2, r14
  LOAD r15, r2
  LDI r5, 962
  STORE r5, r7
  LOAD r15, r5
  LDI r0, 2711
  STORE r0, r13
  LOAD r8, r0
  LDI r3, 255
  STORE r3, r7
  LOAD r0, r3
  CMPI r8, 192
  LDI r4, 31
loop_0:
  CMPI r2, r11, 103
  LDI r1, 0x90DA95
  LDI r26, 2893
  LDI r10, 16
  LDI r3, 1758
  CIRCLE r1, r26, r10, r3
  LDI r15, 1
  SUB r4, r4, r15
  JNZ r4, loop_0
  PUSH r1
  PUSH r11
  PUSH r9
  PUSH r18
  OR r1, r2, r11
  SHL r10, r2, r14
  POP r18
  POP r9
  POP r11
  POP r1
  HALT
