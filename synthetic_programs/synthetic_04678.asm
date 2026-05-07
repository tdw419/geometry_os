; mixed program
; initialization
  LDI r4, 111
  LDI r3, 16
  LDI r10, 0x7E49B9
  LDI r7, 64
  CMPI r13, 233
  LDI r4, 28
loop_0:
  ADD r8, r1, r12
  SUBI r29, r5, 0xAC1DEA
  LDI r5, 0x89AC2B
  LDI r13, 0x290434
  LDI r7, 0x940552
  WPIXEL
  ADDI r1, r8, 255
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  IKEY r7
  CMPI r7, 255
  JNZ r7, key_1
  SAR r13, r8, r0
  SHLI r7, r14, 7
  CALL func_2
func_2:
  DIV r2, r14, r6
  SHR r15, r8, r12
  RET
  CMP r14, r12
main_3:
  SHL r1, r5, r13
  SHLI r11, r13, 0x681651
  SHLI r9, r12, 0xED9F6A
  SHL r13, r11, r7
  SHR r3, r10, r11
  CMPI r3, 233
  LDI r5, 8
  LDI r12, 2
  LDI r10, 16
  DRAWTEXT r5, r12, r10, "WORLD"
  IKEY r10
  CMPI r10, 237
  JNZ r10, key_4
  FRAME
  JMP main_3
