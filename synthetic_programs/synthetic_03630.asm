; mixed program
; initialization
  LDI r3, 1546
  LDI r4, 0xEF3D3E
  LDI r5, 0x311CA2
  SHL r13, r8, r5
  SHL r11, r14, r12
  SHR r3, r11, r9
  IKEY r5
  CMPI r5, 122
  JNZ r5, key_0
  SAR r10, r14, r3
  SHR r0, r3, r11
  CALL func_1
func_1:
  ADD r3, r5, r10
  SHR r15, r8, r3
  SHR r12, r11, r6
  SHR r15, r9, r11
  SUB r1, r15, r6
  RET
  HALT
