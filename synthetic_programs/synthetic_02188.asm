; input driven program
; initialization
  LDI r6, 162
  LDI r0, 2060
  LDI r8, 0
  LDI r5, 4
  LDI r14, 0xC26444
  LDI r9, 0xB575DE
  LDI r15, 0xB4853A
  LDI r13, 2964
main_0:
  XOR r4, r9, r26
  XOR r15, r12, r2
  SAR r11, r9, r13
  SHL r7, r12, r8
  SHLI r1, r7, 128
  SHLI r11, r2, 0x50836F
  SHL r11, r9, r31
  SHL r0, r11, r8
  SHR r3, r7, r5
  SAR r6, r12, r15
  SAR r10, r2, r4
  IKEY r7
  CMPI r7, 0x3D43BD
  JNZ r7, key_1
  FRAME
  JMP main_0
