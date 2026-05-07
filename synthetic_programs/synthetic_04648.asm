; mixed program
; initialization
  LDI r7, 1588
  LDI r5, 0xB2E630
  LDI r11, 1409
  LDI r1, 1
  LDI r14, 0x5B7D1F
loop_0:
  MOD r1, r21, r2
  LDI r2, 16
  LDI r3, 1051
  LDI r15, 0x3B8A5E
  LDI r9, 0x050DBB
  LDI r4, 128
  LINE r2, r3, r15, r9, r4
  LDI r1, 1
  SUB r14, r14, r1
  JNZ r14, loop_0
  OR r12, r3, r6
  OR r4, r0, r2
  SHR r7, r10, r1
  CALL func_1
func_1:
  OR r10, r8, r30
  OR r8, r6, r14
  AND r13, r11, r8
  RET
  SAR r0, r4, r3
  SHLI r10, r7, 4
  SHLI r4, r9, 6
  SAR r9, r15, r8
  AND r14, r11, r9
  AND r4, r1, r10
  OR r9, r5, r14
  AND r8, r12, r11
main_2:
  LDI r13, 0x66F000
  LDI r5, 1
  LDI r8, 256
  WPIXEL
  IKEY r11
  CMPI r11, 0x87B4A4
  JNZ r11, key_3
  SHL r15, r14, r9
  SHL r13, r15, r11
  SHR r12, r10, r14
  CMP r15, r13
  OR r13, r6, r3
  XOR r4, r14, r0
  XOR r14, r4, r2
  LDI r6, 16
  LDI r9, 0x0BF16D
  LDI r0, 255
  TEXT r6, r9, r0, "HELLO"
  FRAME
  JMP main_2
