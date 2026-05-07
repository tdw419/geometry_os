; mixed program
; initialization
  LDI r6, 255
  LDI r14, 255
  LDI r11, 0x437029
  LDI r4, 94
  LDI r1, 0x69E573
  LDI r9, 2
  LDI r10, 1823
  LDI r13, 2
  OR r11, r5, r6
  OR r10, r15, r14
  LDI r9, 0xA4573B
loop_0:
  SHL r3, r8, r11
  LDI r2, 0x0C5BCB
  LDI r1, 0xB327A1
  LDI r15, 10
  WPIXEL
  SUBI r4, r6, 32
  SHL r11, r13, r5
  LDI r5, 1
  SUB r9, r9, r5
  JNZ r9, loop_0
  DIV r0, r25, r5
  CMP r2, r4
  XOR r5, r12, r3
  LDI r7, 4
  LDI r22, 10
  LDI r1, 64
  TEXT r7, r22, r1, "HELLO"
  CMPI r13, 10
main_1:
  DIV r6, r7, r0
  SHLI r1, r3, 2
  SHR r8, r14, r9
  SHLI r2, r15, 0
  SHLI r5, r15, 0x022407
  OR r12, r18, r15
  XOR r10, r3, r6
  CMP r11, r28
  SUBI r31, r3, 0xF5F767
  FRAME
  JMP main_1
