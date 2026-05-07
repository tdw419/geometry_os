; input driven program
; initialization
  LDI r0, 64
  LDI r8, 10
  LDI r6, 0x43993C
  LDI r23, 0xA3411D
main_0:
  SHLI r3, r9, 0x0F44A1
  SHR r3, r12, r13
  SHLI r5, r6, 4
  SHR r12, r9, r13
  IKEY r11
  CMPI r11, 8
  JNZ r11, key_1
  MUL r2, r11, r6
  FRAME
  JMP main_0
