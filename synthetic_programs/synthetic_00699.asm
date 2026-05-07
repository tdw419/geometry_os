; input driven program
; initialization
  LDI r9, 2
  LDI r11, 256
  LDI r10, 0x14FCD6
  LDI r14, 0x32008F
  LDI r5, 0x8F14F8
  LDI r2, 455
  LDI r8, 0xE444EA
main_0:
  IKEY r2
  CMPI r2, 8
  JNZ r2, key_1
  LDI r8, 3337
  LDI r0, 16
  LDI r3, 0xEBCA2A
  LDI r0, 3196
  LDI r2, 0xB1FFEB
  LINE r8, r0, r3, r0, r2
  CMPI r12, 0xE03DDF
  LDI r3, 256
  LDI r5, 0xD231C7
  LDI r8, 0x3859DE
  DRAWTEXT r3, r5, r8, "WORLD"
  CMPI r1, r15, 256
  SHR r0, r16, r12
  SAR r15, r7, r14
  SHLI r23, r15, 1
  FRAME
  JMP main_0
