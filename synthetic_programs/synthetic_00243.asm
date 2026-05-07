; mixed program
; initialization
  LDI r12, 1399
  LDI r7, 0x805C7D
  LDI r0, 256
  SHLI r2, r5, 0x47645C
  SAR r8, r13, r1
  OR r4, r6, r15
  XOR r13, r15, r4
  AND r10, r9, r1
  DIV r1, r11, r0
  PUSH r20
  PUSH r14
  PUSH r4
  PUSH r5
  SHL r2, r6, r15
  SHR r7, r10, r3
  OR r6, r21, r14
  OR r0, r1, r7
  SHL r14, r7, r11
  POP r5
  POP r4
  POP r14
  POP r20
  CALL func_0
func_0:
  SUB r13, r5, r6
  SHL r14, r11, r15
  ADD r11, r9, r12
  RET
main_1:
  LDI r13, 1
  LDI r0, 2936
  LDI r8, 2276
  DRAWTEXT r13, r0, r8, "WORLD"
  CMPI r10, 0x60BB34
  LDI r2, 16
  LDI r11, 0x32F1F4
  LDI r13, 255
  PSETI
  IKEY r29
  CMPI r29, 0xB601B3
  JNZ r29, key_2
  FRAME
  JMP main_1
