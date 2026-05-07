; mixed program
; initialization
  LDI r11, 0
  LDI r7, 64
  LDI r8, 0x9D061A
  LDI r5, 1012
  LDI r0, 3534
  LDI r9, 1
  LDI r13, 128
  LDI r6, 0x4804F8
  CMP r14, r9
  IKEY r10
  CMPI r10, 4
  JNZ r10, key_0
  CALL func_1
func_1:
  SUB r6, r0, r14
  MUL r12, r9, r7
  ADD r31, r9, r0
  SHR r7, r4, r1
  RET
  HALT
