; mixed program
; initialization
  LDI r2, 0x9E7266
  LDI r10, 0xEA54D7
  LDI r13, 2
  LDI r0, 3174
  LDI r14, 10
  LDI r8, 2434
; palette
  LDI r4, 0x23F5
  LDI r14, 1
  LDI r11, 0x008888
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x000066
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x000000
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFF00FF
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x000000
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFF0000
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x8800FF
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFF4400
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFF4400
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x00FFFF
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFFFFFF
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0x00FF00
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xAAFF00
  STORE r4, r11
  ADD r4, r4, r14
  LDI r11, 0xFF00FF
  STORE r4, r11
  ADD r4, r4, r14
  CALL func_0
func_0:
  ADD r12, r15, r4
  OR r3, r7, r12
  XOR r13, r15, r30
  ADD r0, r14, r3
  SUB r14, r12, r1
  RET
  SAR r15, r0, r10
  SHR r3, r14, r1
  XOR r4, r6, r9
  IKEY r7
  CMPI r7, 214
  JNZ r7, key_1
  CALL func_2
func_2:
  SHL r0, r21, r6
  ADD r12, r3, r1
  AND r4, r12, r7
  XOR r4, r3, r13
  OR r6, r25, r3
  OR r4, r10, r14
  RET
  SHLI r7, r8, 256
  SAR r11, r12, r24
  CALL func_3
func_3:
  OR r0, r6, r12
  DIV r20, r1, r15
  MUL r14, r12, r4
  SHR r2, r12, r1
  AND r3, r14, r4
  SHR r6, r12, r10
  RET
  SHLI r20, r3, 6
  SHL r6, r31, r9
  SHR r8, r22, r3
main_4:
  DIV r10, r13, r15
  OR r7, r5, r0
  LDI r3, 255
  FILL r3
  FRAME
  JMP main_4
