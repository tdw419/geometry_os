; mixed program
; initialization
  LDI r12, 16
  LDI r3, 0x5D32B3
  LDI r2, 128
  LDI r5, 10
  LDI r14, 256
  LDI r7, 0x6DA1DA
  SHL r7, r11, r4
  SHL r8, r1, r28
  SHLI r1, r6, 0
  LDI r2, 1
  FILL r2
  CALL func_0
func_0:
  AND r9, r5, r6
  SUB r13, r2, r29
  OR r31, r5, r0
  SHR r4, r12, r0
  DIV r7, r10, r9
  SHL r8, r1, r12
  RET
  SHL r7, r10, r12
main_1:
  OR r1, r8, r3
  SHR r0, r10, r7
  SHL r13, r8, r3
  SHR r8, r1, r9
  SHL r11, r8, r6
  IKEY r4
  CMPI r4, 0x2CA0E2
  JNZ r4, key_2
  LDI r6, 3411
  LDI r1, 0x1146CE
  LDI r8, 32
  WPIXEL
  FRAME
  JMP main_1
